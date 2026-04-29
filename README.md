# duckdb-unitycatalog-playground

## Quick Start

All of the examples found in the blog are also found as runnable scripts here.

### Delta Examples

If you want to only run Delta examples, you can skip Docker (or manual OSS Unity Catalog setup), and
get started as follows. Assuming you have duckdb (>= v1.5.2) and uv, the following will get you instantly bootstrapped for Delta:

```sh
git clone https://github.com/benfleis/duckdb-unitycatalog-playground.git
cd duckdb-unitycatalog-playground
uv venv
. .venv/bin/activate
uv pip install -r requirements.txt
scripts/run-delta
```

Other venv/pip combinations can of course be made to work, this reflects my env!

### Unity Catalog Examples

Keeping it simple, we have encapsulated the key OSS Unity Catalog setup pieces in a Docker image,
building upon the great work by the OSS team (see [our fork source](https://github.com/newfront/unitycatalog-playground/)). Here we have injected duckdb and a few directories to bring it all together. In order to run you'll need to build and run the duckdb-playground image, then you can execute the unity examples.

```sh
docker build -t duckdb-playground .
docker compose up
```

If all worked, you will see the Unity Catalog ASCII art in the logs. In another terminal you can run
the examples as a batch:

```sh
scripts/run-unity
```
