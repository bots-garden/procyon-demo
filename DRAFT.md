

> main commands for the demo
```bash
procyonctl task deploy k33g/forty-two/1.0.0/forty-two.wasm forty-two rev1
procyonctl task deploy k33g/hello-world/1.0.1/hello-world.wasm hello-world rev1
procyonctl task deploy k33g/hello-world/1.0.2/hello-world.wasm hello-world rev2

procyonctl task list

procyonctl task switch-func-revision forty-two rev1 #on/off

procyonctl task switch-func-revision hello-world rev2 #on/off

procyonctl func list

procyonctl func get forty-two
procyonctl func get hello-world
procyonctl func get-revision hello-world rev1
procyonctl func get-revision hello-world rev2

procyonctl func post hello 'Jane Doe'
procyonctl func post-revision hello rev1 'John Doe'

```