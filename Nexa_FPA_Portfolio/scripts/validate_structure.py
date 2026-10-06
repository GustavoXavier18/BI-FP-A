from pathlib import Path
import json,jsonschema,urllib.parse,collections,re
B=Path(__file__).resolve().parent/'schemas';ROOT=Path(__file__).resolve().parents[1];store={}
for p in B.rglob('*.json'):
 j=json.loads(p.read_text());u='https://developer.microsoft.com/json-schemas/'+str(p.relative_to(B));store[u]=j
 if j.get('$id'):store[j['$id']]=j
from referencing import Registry, Resource
from referencing.jsonschema import DRAFT7
registry=Registry().with_resources((u,Resource.from_contents(s,default_specification=DRAFT7)) for u,s in store.items())
errors=[];tested=0
for p in ROOT.rglob('*'):
 if p.suffix in ['.json','.pbip','.pbir','.pbism']:
  j=json.loads(p.read_text());u=j.get('$schema') if isinstance(j,dict) else None
  if u and u in store:
   tested+=1
   validator=jsonschema.Draft7Validator(store[u],registry=registry)
   for e in validator.iter_errors(j):errors.append({'file':str(p.relative_to(ROOT)),'path':list(e.path),'message':e.message})
print('SCHEMA FILES',tested,'ERRORS',len(errors));print(json.dumps(errors,ensure_ascii=False,indent=2)[:18000])
(ROOT/'docs'/'schema_validation.json').write_text(json.dumps({'validated_files':tested,'errors':errors},ensure_ascii=False,indent=2))
