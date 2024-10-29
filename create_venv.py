import os
import virtualenv

env_dir = '/venv'

if not os.path.exists(env_dir) or not virtualenv.is_valid_environment(env_dir):
    virtualenv.create_environment(env_dir, site_packages=True)
