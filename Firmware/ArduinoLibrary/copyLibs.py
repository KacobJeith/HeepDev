#Python script to copy folders in script's directory to a user specified folder. Used for keeping Arduino Libraries up to date

from Tkinter import Tk
from tkFileDialog import askdirectory
import tkMessageBox
from shutil import *
import errno
import sys
import os 

dir_path = os.path.dirname(os.path.realpath(__file__))

print("Copying Directories in path: " + dir_path)

def ignore_function(ignore):
    def _ignore_(path, names):
        ignored_names = []
        if ignore in names:
            ignored_names.append(ignore)
        return set(ignored_names)
    return _ignore_

def copytree(src, dst, symlinks=False, ignore=None):
    names = os.listdir(src)
    if ignore is not None:
        ignored_names = ignore(src, names)
    else:
        ignored_names = set()

    if not os.path.isdir(dst): # This one line does the trick
        os.makedirs(dst)
    errors = []
    for name in names:
        if name in ignored_names:
            continue
        srcname = os.path.join(src, name)
        dstname = os.path.join(dst, name)
        try:
            if symlinks and os.path.islink(srcname):
                linkto = os.readlink(srcname)
                os.symlink(linkto, dstname)
            elif os.path.isdir(srcname):
                copytree(srcname, dstname, symlinks, ignore)
            else:
                # Will raise a SpecialFileError for unsupported file types
                copy2(srcname, dstname)
        # catch the Error from the recursive copytree so that we can
        # continue with other files
        except Error, err:
            errors.extend(err.args[0])
        except EnvironmentError, why:
            errors.append((srcname, dstname, str(why)))
    try:
        copystat(src, dst)
    except OSError, why:
        if WindowsError is not None and isinstance(why, WindowsError):
            # Copying file access times may fail on Windows
            pass
        else:
            errors.extend((src, dst, str(why)))
    if errors:
        raise Error, errors
        return False

    return True


Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
destination_folder = askdirectory(message = "Please select Arduino Library folder") # show an "Open" dialog box and return the path to the selected file

print(destination_folder)

if destination_folder:
    confirm = tkMessageBox.askokcancel("Confirm?", "Copy directories to: "+destination_folder+" ?")
else:
    exit()
if confirm == True:
    if copytree(dir_path, destination_folder, ignore=ignore_patterns(sys.argv[0]) ) == True:
        tkMessageBox.showinfo("Done!", "All finished. Good Boy.")
    else:
        tkMessageBox.showinfo("Errored!", "Bad Boy.")
else:
    tkMessageBox.showinfo("No Directories Copied", "Goodbye.")
    exit()