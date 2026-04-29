# duckdb-unitycatalog-playground

## Quick Start

This repo [builds upon great work done
here](https://github.com/newfront/unitycatalog-playground), and houses a docker
image which contains:

- [DuckDB](https://duckdb.org) + Delta + Unity Catalog Extensions
- [OSS Unity Catalog](https://www.unitycatalog.io/)
- Supporting python packages: [pyspark](https://spark.apache.org/),
  [deltalake](https://github.com/delta-io/delta-rs), and others...

All of the examples found in the DuckDB blog are also found as runnable scripts here.

### Delta Examples

If you want to only run Delta examples, you can skip Docker (or manual OSS
Unity Catalog setup), and get started as follows. Assuming you have duckdb (>=
v1.5.2) and uv, the following will get you instantly bootstrapped for Delta:

```sh
git clone https://github.com/benfleis/duckdb-unitycatalog-playground.git
cd duckdb-unitycatalog-playground
uv venv
. .venv/bin/activate
uv pip install -r requirements.txt
scripts/run-delta
```

This is one tested configuration with uv; other venv/pip combinations can of
course be made to work with some tweaking.

The individual scripts can all be found under [scripts/delta](scripts/delta)
labeled to match examples found in the blog.

### Unity Catalog Examples

Keeping it simple, we have encapsulated the key OSS Unity Catalog setup pieces
in a Docker image, building upon the great work by the OSS team (see [our fork
source](https://github.com/newfront/unitycatalog-playground/)). Here we have
injected duckdb and a few directories to bring it all together. In order to run
you'll need to build and run the `duckdb-playground` image, then you can execute
the unity examples. You will need docker to proceed.

```sh
docker build -t duckdb-playground .
docker compose up
```

If all worked, you will see the Unity Catalog ASCII art in the logs. In another terminal you can run
the examples as a batch:

```sh
scripts/run-unity
```

### DuckDB Shell

If you'd like to get hands on, you can easily invoke a duckdb CLI within the docker context:

```sh
docker exec -it duckdb-playground duckdb
```

From there you can manually execute everything found in [scripts/unity](scripts/unity).
