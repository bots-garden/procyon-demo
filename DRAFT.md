

> main commands for the demo
```bash
procyonctl task deploy k33g/forty-two/1.0.0/forty-two.wasm forty-two rev1
procyonctl task deploy k33g/hello-world/1.0.1/hello-world.wasm hello-world rev1
procyonctl task list

procyonctl task switch-func-revision forty-two rev1
procyonctl task switch-func-revision hello-world rev1

procyonctl func list

procyonctl func get forty-two
procyonctl func get-revision hello-world rev1

procyonctl func post hello 'Jane Doe'
procyonctl func post-revision hello rev1 'John Doe'

```