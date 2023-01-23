## Hardware

```
uname -a:              Linux Server 6.1.2-arch1-1 #1 SMP PREEMPT_DYNAMIC Sat, 31 Dec 2022 17:40:35 +0000 x86_64 GNU/Linux
Model name:            Intel(R) Celeron(R) CPU J3455 @ 1.50GHz
  CPU family:          6
  Model:               92
  Thread(s) per core:  1
  Core(s) per socket:  4
  Socket(s):           1
```

## Data

Compression speed after 2 minutes on compression level 2

Using:

```
-rw-r--r--  1 root  backup 5.4K Jan 22 21:11 2023-01-23-000.log
-rw-r--r--  1 root  backup  16M Jan 22 21:03 2023-01-23-000.manifest
-rw-r--r--  1 root  backup  23M Jan 22 21:04 2023-01-23-000.records
```

The files within the manifest are on multiple different disks and the archive is being written to
a RAID 1 HHD array via USB 3.0 cable. Some files are on internal flash drive, some are on internal 
SSD, and some are on an external SSD.

> TODO: I completely forgot to show output sizes lol

 Tool | Threads | Level | Speed      | Notes
------|---------|-------|------------|--------------------------------
 none | 1       | N/A   | 22.6 MiB/s |
 gzip | 1       | 1     | 15.1 MiB/s | 1 is the lowest level for gzip
 gzip | 1       | 2     | 15.1 MiB/s | Was the same as 1
 lz4  | 1       | 0     | 23.9 MiB/s |
 lz4  | 1       | 2     | 23.9 MiB/s | Was the same as 0
 pigz | 4       | 0     | 22.3 MiB/s |
 pigz | 4       | 2     | 25.0 MiB/s |
 pigz | 4       | 3     | 25.2 MiB/s |
 pigz | 4       | 4     | 25.0 MiB/s |
 pigz | 4       | 5     | 24.8 MiB/s |
 pigz | 4       | 6     | 25.1 MiB/s |
 pigz | 4       | 7     | 25.4 MiB/s |
 pigz | 4       | 8     | 25.1 MiB/s |
 pigz | 4       | 9     | 24.6 MiB/s |
 xz   | 4       | 0     |  7.5 MiB/s |
 xz   | 4       | 2     |  5.2 MiB/s |
 zstd | 1       | 0     | 24.3 MiB/s |
 zstd | 1       | 2     | 25.3 MiB/s |

