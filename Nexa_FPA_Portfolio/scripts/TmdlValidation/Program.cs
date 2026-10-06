using System;
using System.IO;
using System.Linq;
using System.Text.Json;
using Microsoft.AnalysisServices.Tabular;
try {
 var root=Path.GetFullPath(args.Length>0?args[0]:Directory.GetCurrentDirectory());
 var path=Path.Combine(root,"Nexa_FPA_Portfolio.SemanticModel","definition");
 Console.WriteLine("Partition QueryGroup: "+typeof(Partition).GetProperty("QueryGroup"));
 var db=TmdlSerializer.DeserializeDatabaseFromFolder(path);
 var model=db.Model;
 var conflicts=model.Tables.SelectMany(t=>t.Measures.Select(m=>new {table=t.Name,measure=m.Name,staticFormat=m.FormatString,dynamicFormat=m.FormatStringDefinition})).Where(m=>!string.IsNullOrEmpty(m.staticFormat)&&m.dynamicFormat!=null).Select(m=>m.table+"["+m.measure+"]").ToArray();
 if(conflicts.Length>0)throw new InvalidOperationException("Unsupported simultaneous FormatString and FormatStringDefinition: "+string.Join(", ",conflicts));
 var facts=model.Tables.Select(t=>new {table=t.Name, columns=t.Columns.Count, measures=t.Measures.Count, partitions=t.Partitions.Count}).ToArray();
 var data=new {valid=true,compatibilityLevel=db.CompatibilityLevel,tables=model.Tables.Count,relationships=model.Relationships.Count,measures=model.Tables.Sum(t=>t.Measures.Count),details=facts};
 Console.WriteLine(System.Text.Json.JsonSerializer.Serialize(data));
 File.WriteAllText(Path.Combine(root,"docs","tmdl_validation.json"),System.Text.Json.JsonSerializer.Serialize(data,new JsonSerializerOptions{WriteIndented=true}));
 // Syntax load only; no server connection, engine execution or refresh.
} catch(Exception e) {Console.WriteLine(e.ToString());Environment.Exit(1);}
