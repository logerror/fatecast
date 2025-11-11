# Releasing fatecast to PyPI

Follow these steps whenever you want to cut a new public release so users can `pip install fatecast`.

1. **Decide the version**
   - Update `project.version` inside `pyproject.toml`.
   - Add a matching entry to your changelog (if you keep one).

2. **Clean & test locally**
   ```bash
   rm -rf dist build *.egg-info
   make lint
   make test
   ```

3. **Build the distributions**
   ```bash
   python -m build
   ```
   This produces both the source distribution (`.tar.gz`) and the wheel (`.whl`) under `dist/`.

4. **Upload to PyPI**
   - For the real release:
     ```bash
     python -m twine upload dist/*
     ```
   - For a rehearsal, use TestPyPI first:
     ```bash
     python -m twine upload --repository testpypi dist/*
     ```

5. **Verify**
   - Install from PyPI in a clean virtual environment: `pip install fatecast`.
   - Launch the TUI: `fatecast` or `python -m fatecast`.

6. **Tag & push**
   ```bash
   git tag vX.Y.Z
   git push origin main --tags
   ```

Once these steps are complete, the package is available publicly and users can install it directly via `pip install fatecast`.

