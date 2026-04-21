import shutil
import pathlib as pt

source = pt.Path('S10/Q04.py')
destination = pt.Path('S10/Q04_copie.py')

shutil.copy(source, destination)

shutil.make_archive(destination,'zip', destination.parent, destination.name)

