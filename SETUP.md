# Setup

## Steps

This document describes what is done to set up this project's Python environment.

What this setup does (done **once**, by me):

- create environment with `python=3.11`
- activate environment
- set interpreter
- set kernel
- install packages
- export environment to `environment.yml`

In a separate script:

- generate dataset

In a further separate script:

- import relevant packages/functions
- load in the data
- perform some task on the data

## Reproducibility

Anybody who wants to test the reproducibility of this project should:

- **NOT** follow the steps below to create a new environment from scratch
- instead, run:

  ```bash
  conda env create -f environment.yml
  ```

- then run the other script(s) as described above

## Create and activate conda environment

```bash
conda env list
conda create -n zas-python-reproducible-example python=3.11
conda activate zas-python-reproducible-example
conda env list
```

## Set interpreter and kernel (VS Code)

1. `Ctrl+Shift+P` → select **Python: Select Interpreter**
2. Pick your environment from the list
3. Select **Kernel** (top right corner) → find your environment

## Install packages

```bash
conda install pandas numpy
```

## Export environment

```bash
conda env export --from-history > environment.yml
```

Now, every time I open this project again on the same computer I run:

```bash
conda activate zas-python-reproducible-example
```

But if I am opening this project for the first time on a new computer I run:

```bash
conda env create -f environment.yml
```

Where I add the full file path to `environment.yml`, unless the file is directly sitting in my current working directory. For example:

```bash
conda env create -f ~/Python/Code-Review/environment.yml
```

And thereafter run `conda activate zas-python-reproducible-example` whenever I open the project again.


