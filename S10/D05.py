#pip install psutil
#pip list
#pip --help
import psutil

print(psutil.cpu_percent(interval=1))

print(psutil.disk_partitions(), '\n')