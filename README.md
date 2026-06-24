# ZAS Python Working Group: Reproducible Example

This project is a minimal example of a reproducible Python project.

## Folder structure

- `data/` contains the toy dataset `vowel_duration_toy_dataset.csv`
- `scripts/` contains two Jupyter notebooks:
  - `01-data_simulation.ipynb`
  - `02-analysis.ipynb` —> **run this one after activating the environment**
- `environment.yml` use this to set up the environment (see below)
- `README.md` this file
- `SETUP.md` documentation of how this project was set up

## Environment setup

This project uses a conda environment defined in `environment.yml`. You do not need to create this environment from scratch, it has already been built and exported for you. See `SETUP.md` for details on how the environment was originally created (for reference only, you do not need to follow those steps).

### First time setup (do this once)

When you first download or clone this project, create the environment from the provided `environment.yml` file (adding any necessary filepath from your current wd to `environment.yml`; e.g., `~/Python/zas-python-code-review/environment.yml`):

```bash
conda env create -f environment.yml
```

This reads the package list from `environment.yml` and builds a matching environment on your machine, named the same as in the file.

Once created, activate it:

```bash
conda activate zas-python-reproducible-example
```

(Replace `zas-python-reproducible-example` with whatever the environment is actually named in `environment.yml`, if different. You can check the name at the top of that file, or by running `conda env list` after creation.)

### Setting the interpreter and kernel in VS Code

If you're working in VS Code (or Jupyter via VS Code):

1. `Ctrl+Shift+P` → **Python: Select Interpreter**
2. Choose the environment you just created from the list
3. If using a notebook, select **Kernel** (top right corner) and choose the same environment

## Every time after that

You don't need to recreate the environment again. Each new session, just activate it:

```bash
conda activate zas-python-reproducible-example
```

Then run the analysis script (`scripts/02-analysis.ipynb`)

If VS Code already has the right interpreter and kernel selected from before, you don't need to repeat that step either, it should persist for this project going forward. If you ever see VS Code defaulting to a different interpreter, just repeat the steps above to reselect this environment.

## Troubleshooting

If `conda env create -f environment.yml` fails partway through, or you want to start fresh, remove the partially created environment first:

```bash
conda env remove --name zas-python-wg
```

then re-run the create command.
