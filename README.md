
# STEP 1 : CREATE WORKSPACE "personal-workspace"
# STEP 2 : CLOSE DBEAVER AND REMOVE "personal-workspace"
# STEP 3 : MAKE SYMLINK TO REPOSITORY FROM dbeaver "personal-workspace"
    cd ~/.local/share/DBeaverData
    ln -s  ~/projecten/db-scripts/personal-workspace
# STEP 4 : RESTART DBEAVER