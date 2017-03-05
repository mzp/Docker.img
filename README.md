# Docker.img: Use raw disk image at Docker for Mac
Current Docker for Mac(as long as 17.03.0-ce-mac1) use qcow2 as disk image format. But qcow2 is worse performance than raw format.

This short script change image type qcow2 to raw.

## Usage
### Install

```
curl https://raw.githubusercontent.com/mzp/Docker.img/master/install.sh | bash
```

### Uninstall

```
cd /Applications/Docker.app/Contents/MacOS
rm com.docker.hyperkit
mv com.docker.hyperkit.original com.docker.hyprekit

cd ~/.docker
rm -rf jp.mzp.img
```

## Benchmark
Run [fio](https://github.com/axboe/fio) on MacBookPro(Late 2016).

```
fio -filename=/tmp/test2g -direct=1 -rw=read -bs=4k -size=2G -numjobs=64 -runtime=10 -group_reporting -name=file1
fio -filename=/tmp/test2g -direct=1 -rw=write -bs=4k -size=2G -numjobs=64 -runtime=10 -group_reporting -name=file1
```

### Sequential Read

|               | Average(MiB/s) | Min(MiB/s) | Max(MiB/s) |
| ------------- |:--------------:|-----------:|-----------:|
| navite        | 361            | 361        | 361        |
| qcow2         | 46             | 46         | 46         |
| docker machine| 105            | 105        | 105        |
| raw           | 147            | 147        | 147        |

### Sequential Write

|               | Average(MiB/s) | Min(MiB/s) | Max(MiB/s) |
| ------------- |:--------------:|-----------:|-----------:|
| navite        | 487            | 487        | 487        |
| qcow2         | 29             | 29         | 29         |
| docker machine| 51             | 51         | 51         |
| raw           | 45             | 45         | 45        |

