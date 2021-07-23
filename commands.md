## Commands ran

**Create api project**

```shell
mix phx.new poller --no-webpack --no-html
```

**Generate Poll object**

```shell
mix phx.gen.json Polls Poll polls question:string
```

**Generate Options in DB**

```shell
mix phx.gen.json Polls Option options value:string poll_id:references:polls
```