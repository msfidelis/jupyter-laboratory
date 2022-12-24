

# Run Lab on Docker 

In your Notebook Folder

```bash
docker run -p 8888:8888 -v $(pwd):/lab -it fidelissauro/jupyter-laboratory
```