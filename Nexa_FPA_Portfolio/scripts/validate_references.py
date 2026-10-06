from pathlib import Path
import json,re,collections,hashlib
ROOT=Path(__file__).resolve().parents[1];doc=ROOT/'docs';model=json.loads((doc/'modelo_manifest.json').read_text());tables={t:{c[0] for c in v['columns']} for t,v in model['tables'].items()};tables['_Medidas']={'_Oculto'};manifest=json.loads((doc/'medidas_manifest.json').read_text());measures={m['name'] for m in manifest};errors=[];total=0
for m in manifest:
 for expr in [m['dax'],m.get('dynamicFormat','')]:
  clean=re.sub(r'"(?:[^"]|"")*"','',expr)
  for match in re.finditer(r"(?:'([^']+)'|([A-Za-z_][A-Za-z0-9_]*))\[([^\]]+)\]",clean):
   t=match.group(1) or match.group(2);c=match.group(3);total+=1
   if t not in tables or c not in tables[t]:errors.append({'measure':m['name'],'field':t+'['+c+']'})
  clean=re.sub(r"(?:'([^']+)'|([A-Za-z_][A-Za-z0-9_]*))\[([^\]]+)\]",'',clean)
  for dep in re.findall(r'\[([^\]]+)\]',clean):
   total+=1
   if dep not in measures:errors.append({'measure':m['name'],'dependency':dep})
if len(measures)!=len(manifest):errors.append({'message':'Duplicate measure names'})
for a,b,c,d in model['relationships']:
 if a not in tables or b not in tables[a] or c not in tables or d not in tables[c]:errors.append({'relationship':[a,b,c,d]})
 if not c.startswith('d'):errors.append({'message':'Relationship does not originate from dimension','relationship':[a,b,c,d]})
R=ROOT/'Nexa_FPA_Portfolio.Report';PD=R/'definition'/'pages';pages={p.parent.name for p in PD.glob('*/page.json')};resources={p.name for p in (R/'StaticResources'/'RegisteredResources').iterdir()}
def walk(x,context):
 global total
 if isinstance(x,dict):
  for kind in ['Column','Measure']:
   if kind in x and isinstance(x[kind],dict):
    prop=x[kind];table=prop.get('Expression',{}).get('SourceRef',{}).get('Entity');c=prop.get('Property')
    if table:
     total+=1
     if table not in tables or c not in (measures if kind=='Measure' and table=='_Medidas' else tables.get(table,set())):errors.append({'visual':context,'field':[kind,table,c]})
  if 'ResourcePackageItem' in x:
   n=x['ResourcePackageItem'].get('ItemName')
   if n not in resources:errors.append({'resource':n})
  for v in x.values():walk(v,context)
 elif isinstance(x,list):
  for v in x:walk(v,context)
for p in PD.rglob('visual.json'):
 j=json.loads(p.read_text());page=json.loads((p.parents[2]/'page.json').read_text());pos=j['position'];context=str(p.relative_to(ROOT));walk(j,context)
 if pos['x']<0 or pos['y']<0 or pos['x']+pos['width']>page['width']+.01 or pos['y']+pos['height']>page['height']+.01:errors.append({'bounds':context})
 for o in j['visual'].get('visualContainerObjects',{}).get('visualLink',[]):
  prop=o['properties']
  if 'navigationSection' in prop:
   dest=prop['navigationSection']['expr']['Literal']['Value'][1:-1]
   if dest not in pages:errors.append({'navigation':dest})
 for o in j['visual'].get('visualContainerObjects',{}).get('visualTooltip',[]):
  dest=o['properties']['section']['expr']['Literal']['Value'][1:-1]
  if dest not in pages:errors.append({'tooltip':dest})
copy=ROOT/'data'/'Projeto_FPA_Nexa_Distribuicao.xlsx';digest=hashlib.sha256(copy.read_bytes()).hexdigest();assert digest==model['excel_sha256']
output={'checked_references':total,'tables':len(tables),'measures':len(measures),'pages':len(pages),'source_unchanged':True,'errors':errors};(doc/'reference_validation.json').write_text(json.dumps(output,ensure_ascii=False,indent=2));print(json.dumps(output,ensure_ascii=False,indent=2));assert not errors
