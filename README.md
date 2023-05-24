# kali-toolbox
Run kali linux in toolbx

## Build toolbox image
```
podman build -f Containerfile -t "kali-toolbox"
toolbox create --image localhost/kali-toolbox:latest kali
toolbox enter kali
```
