# What is Procyon Showcase?

> 🚧 wip

This project is a running demonstration of the **[Procyon](https://github.com/bots-garden/procyon)** project. Procyon is an kind of orchestrator for the the **[Sat](https://docs.suborbital.dev/sat/)** project.

### What is Sat?

> Sat is a WebAssembly-powered server designed to have the maximum performance and smallest possible footprint.

**Sat** is a small http server, serving a **[Runnable](https://docs.suborbital.dev/atmo/concepts/runnables)** (a Runnable is a wasm module with super powers). 

## How to use this project

It's simple, open this project with **[GitPod](https://www.gitpod.io/)** by clicking on the below button:

[![Open in GitPod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/bots-garden/procyon-showcase)

... And wait a moment ⏳ to let the workspace installation complete.

## How to create a Runnable

👀 this blog post: https://www.wasm.builders/k33g_org/fight-complexity-of-webassembly-with-reactr-222k

## How to publish a Runnable on https://wapm.io/

👀 this blog post: https://www.wasm.builders/k33g_org/publish-your-runnables-on-wapmio-49k0


## Create a Runnable

```bash
subo create runnable hello
```
> 🖐️ there are already some samples in this repository: `hello`, `hey`, `hey-last`, `hey-next`

## Publish the Runnable(s)(*) to the local registry

> - The `registry` command exists only for the Procyon Registry (dev tool). Consider to use wapm.io instead.
> - (*) The wasm modules

```bash
procyon-cli registry publish \
  --path ./hello/hello.wasm \
  --function hello \
  --version 0.0.0 

procyon-cli registry publish \
  --path ./hey/hey.wasm \
  --function hey \
  --version 0.0.0 

procyon-cli registry publish \
  --path ./hey-next/hey-next.wasm \
  --function hey \
  --version 0.0.1

procyon-cli registry publish \
  --path ./hey-last/hey-last.wasm \
  --function hey \
  --version 0.0.2
```

## Deploy the Runnable (wasm modules/functions)

```bash
procyon-cli functions deploy \
  --wasm hello.0.0.0.wasm \
  --function hello \
  --revision rev1

procyon-cli functions deploy \
  --wasm hey.0.0.0.wasm \
  --function hey \
  --revision 🔵

procyon-cli functions deploy \
  --wasm hey.0.0.1.wasm \
  --function hey \
  --revision 🟢

procyon-cli functions deploy \
  --wasm hey.0.0.2.wasm \
  --function hey \
  --revision 🟠
```


## Query the Runnable [`POST`]

```bash
procyon-cli functions call \
  --function hello \
  --method POST \
  --data 'Jane Doe'

# output:
# 🚀 calling function
# 📝 POST ⛎ hello 📦 
# 🌍 http://localhost:8080
# 😡 502

procyon-cli functions call \
  --function hello \
  --revision rev1 \
  --method POST \
  --data 'Jane Doe'

# output:
# 🚀 calling function
# 📝 POST ⛎ hello 📦 rev1
# 🌍 http://localhost:8080
# 🙂 200 : hello Jane Doe

# activate the revision:
procyon-cli functions revision \
	--function hello \
	--revision rev1 \
	--switch on

# output:
# 💡 switch the default revision
# 📝 on ⛎ hello 📦 rev1
# 🙂 [ 200 ] default revision of hello is rev1

# call again the function without specifying the revision:
procyon-cli functions call \
  --function hello \
  --method POST \
  --data 'Jane Doe'

# output:
# 🚀 calling function
# 📝 POST ⛎ hello 📦 
# 🌍 http://localhost:8080
# 🙂 200 : hello Jane Doe
```

## Query the Runnable [`GET`]

```bash
procyon-cli functions call \
  --function hey \
  --revision 🔵 \
  --method GET

# output:
# 🚀 calling function
# 📝 GET ⛎ hey 📦 🔵
# 🌍 http://localhost:8080
# 🙂 200 : <h1>Hey People 😃</h1>

procyon-cli functions call \
  --function hey \
  --revision 🟢 \
  --method GET

# output:
# 🚀 calling function
# 📝 GET ⛎ hey 📦 🟢
# 🌍 http://localhost:8080
# 🙂 200 : <h1>Hey People 🎃</h1>

procyon-cli functions call \
  --function hey \
  --revision 🟠 \
  --method GET

# output:
# 🚀 calling function
# 📝 GET ⛎ hey 📦 🟠
# 🌍 http://localhost:8080
# 🙂 200 : <h1>Hey People 🐯</h1>

# activate the 🟢 revision:
procyon-cli functions revision \
	--function hey \
	--revision 🟢 \
	--switch on

# output:
# 💡 switch the default revision
# 📝 on ⛎ hey 📦 🟢
# 🙂 [ 200 ] default revision of hey is 🟢

# call the default revision:
procyon-cli functions call \
  --function hey \
  --method GET

# output:
# 🚀 calling function
# 📝 GET ⛎ hey 📦 
# 🌍 http://localhost:8080
# 🙂 200 : <h1>Hey People 🎃</h1>
```

## Other commands

### Functions list

```bash
procyon-cli functions list
```

> output
```bash
function-rev            task-id                                 default-revision        http-port
----------------------  --------------------------------------  -----------------       -----------------
hey-🟢                  b2c84e02-ee44-434c-8715-1079eeb2e368    true                    3002
hello-rev1              08bd966d-a408-4d02-9115-3160ea84046e    true                    3000
hey-🔵                  3f4311eb-8b65-4f45-83bf-07b7660b474c    false                   3001
hey-🟠                  dd3e33e8-cfbf-4d0d-90ca-209f9fe63707    false                   3003
```

### Tasks list

```bash
procyon-cli tasks list
```

> output
```bash
task-id                                 module                          states  function
-------------------------------------   -------------------------       ------  ----------------------------
08bd966d-a408-4d02-9115-3160ea84046e    hello.0.0.0.wasm                2|1     hello   rev1(true)
3f4311eb-8b65-4f45-83bf-07b7660b474c    hey.0.0.0.wasm                  2|1     hey     🔵(false)
b2c84e02-ee44-434c-8715-1079eeb2e368    hey.0.0.1.wasm                  2|1     hey     🟢(true)
dd3e33e8-cfbf-4d0d-90ca-209f9fe63707    hey.0.0.2.wasm                  2|1     hey     🟠(false)
```

### Task information

```bash
procyon-cli tasks info --task-id b2c84e02-ee44-434c-8715-1079eeb2e368
```

> output
```bash
📝 get details of a task
🙂 [ 200 ] b2c84e02-ee44-434c-8715-1079eeb2e368
📦 Task Id: b2c84e02-ee44-434c-8715-1079eeb2e368
📝 Wasm Module: hey.0.0.1.wasm
✅ States: 2|1
⛎ Function: hey 🟢(true)
```

### Kill a task

> 🖐️ This is a 🚧 wip, the related process is killed, but the data are not updated
```bash
procyon-cli tasks kill --task-id dd3e33e8-cfbf-4d0d-90ca-209f9fe63707
```

> output
```bash
📝 kill a task
🙂 [ 204 ] task dd3e33e8-cfbf-4d0d-90ca-209f9fe63707 is killed
```

> You should we aware of:
> - the current state of a killed task is `3`
> - the current state of a running task is `2`
```bash
procyon-cli tasks info --task-id dd3e33e8-cfbf-4d0d-90ca-209f9fe63707

# 📝 get details of a task
# 🙂 [ 200 ] dd3e33e8-cfbf-4d0d-90ca-209f9fe63707
# 📦 Task Id: dd3e33e8-cfbf-4d0d-90ca-209f9fe63707
# 📝 Wasm Module: hey.0.0.2.wasm
# ✅ States: 3|3
# ⛎ Function: hey 🟠(false)

procyon-cli tasks info --task-id b2c84e02-ee44-434c-8715-1079eeb2e368

# 📝 get details of a task
# 🙂 [ 200 ] b2c84e02-ee44-434c-8715-1079eeb2e368
# 📦 Task Id: b2c84e02-ee44-434c-8715-1079eeb2e368
# 📝 Wasm Module: hey.0.0.1.wasm
# ✅ States: 2|1
# ⛎ Function: hey 🟢(true)

procyon-cli tasks list

# task-id                                 module                          states  function
# -------------------------------------   -------------------------       ------  ----------------------------
# dd3e33e8-cfbf-4d0d-90ca-209f9fe63707    hey.0.0.2.wasm                  3|3     hey     🟠(false)
# 08bd966d-a408-4d02-9115-3160ea84046e    hello.0.0.0.wasm                2|1     hello   rev1(true)
# 3f4311eb-8b65-4f45-83bf-07b7660b474c    hey.0.0.0.wasm                  2|1     hey     🔵(false)
# b2c84e02-ee44-434c-8715-1079eeb2e368    hey.0.0.1.wasm                  2|1     hey     🟢(true)
```


