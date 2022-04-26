# Tada 🎉

```bash
subo create runnable tada --lang swift
cd tada

subo build .
```

## Publish to the registry

```bash
procyon-cli registry publish \
  --path ./tada/tada.wasm \
  --function tada \
  --version 0.0.0 
```

## Deploy to Procyon

```bash
procyon-cli functions deploy \
  --wasm tada.0.0.0.wasm \
  --function tada \
  --revision 💛
```

## Call the function

```bash
procyon-cli functions call \
  --function tada \
  --revision 💛 \
  --method POST \
  --data 'Jane Doe'

# This is the same of:
curl https://localhost:4443/functions/tada/💛 -d 'Jane Doe'
http https://localhost:4443/functions/tada/💛 name='Jane Doe' --verify=no # for JSON requests
```

## Activate the default revision

```bash
procyon-cli functions revision \
	--function tada \
	--revision 💛 \
	--switch on

curl https://localhost:4443/functions/tada -d 'Jane Doe'
```

