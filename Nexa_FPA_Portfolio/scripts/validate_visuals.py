import json,collections
from pathlib import Path
import jsonschema
ROOT=Path(__file__).resolve().parents[1];j=json.load(open(Path(__file__).resolve().parent/'schemas'/'reportThemeSchema-2.157.json'))
def props(x):
 if '$ref' in x:x=j['definitions'][x['$ref'].split('/')[-1]]
 out=dict(x.get('properties',{}))
 for b in x.get('allOf',[]):out.update(props(b))
 return out
SKIP=object()
def val(x):
 if isinstance(x,dict):
  if 'expr' in x:
   if 'Literal' not in x['expr']:return SKIP
   v=x['expr']['Literal']['Value']
   if v in ['true','false']:return v=='true'
   if v.startswith("'"):return v[1:-1].replace("''","'")
   try:return int(v[:-1]) if v.endswith(('L','D')) and float(v[:-1]).is_integer() else float(v[:-1])
   except:return v
  out={}
  for k,v in x.items():
   a=val(v)
   if a is SKIP:return SKIP
   out[k]=a
  return out
 return x
errors=[];checked=0
for f in (ROOT/'Nexa_FPA_Portfolio.Report'/'definition'/'pages').rglob('visual.json'):
 v=json.loads(f.read_text())['visual'];t=v['visualType'];d=j['definitions'].get('visual-'+t)
 if not d:continue
 p=props(d)
 for ob,entries in {**v.get('objects',{}),**v.get('visualContainerObjects',{})}.items():
  if ob not in p:errors.append({'visual':str(f.relative_to(ROOT)),'object':ob,'message':'Unsupported formatting object'});continue
  fields=p[ob].get('items',{}).get('properties',{})
  for e in entries:
   for field,value in e['properties'].items():
    if ob=='general' and field in ['filter','imageUrl']:continue
    if ob=='visualHeader' and field=='show':continue # container-level visibility is defined by PBIR schema.
    if field not in fields:errors.append({'visual':str(f.relative_to(ROOT)),'object':ob,'property':field,'message':'Unsupported formatting property'});continue
    a=val(value)
    if a is SKIP:continue
    checked+=1
    s={**fields[field],'definitions':j['definitions']}
    for er in jsonschema.Draft7Validator(s).iter_errors(a):errors.append({'visual':str(f.relative_to(ROOT)),'object':ob,'property':field,'message':er.message})
theme_errors=[e.message for e in jsonschema.Draft7Validator(j).iter_errors(json.loads((ROOT/'theme_Nexa.json').read_text()))]
out={'checked_properties':checked,'errors':errors,'theme_errors':theme_errors,'reference':'Microsoft reportThemeSchema-2.157.json; runtime expressions checked structurally in PBIR validation.'};(ROOT/'docs'/'visual_format_validation.json').write_text(json.dumps(out,ensure_ascii=False,indent=2));print(json.dumps(out,ensure_ascii=False,indent=2)[:14000])
