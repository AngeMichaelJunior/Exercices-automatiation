import pathlib
import shutil

SOURCE = pathlib.Path('projet')
ARCHIVE= pathlib.Path('sauvegarde_projet')

shutil.copytree(SOURCE, ARCHIVE,dirs_exist_ok=True)

shutil.make_archive('projet_archive', 'zip', ARCHIVE)
print(f'Archive created: projet_archive.zip')

shutil.rmtree(ARCHIVE)
