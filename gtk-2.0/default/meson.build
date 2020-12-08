gtk2_sources_data = run_command(
    'find', meson.current_source_dir(), '-name', '*rc'
).stdout().strip().split('\n')

gtk2_sources_dest = join_paths(root_themedir, theme_name, 'gtk-2.0')
install_data(gtk2_sources_data, install_dir: gtk2_sources_dest)

gtk2_asset_dir = join_paths(meson.current_source_dir(), 'assets')
gtk2_asset_data = run_command(
    'find', gtk2_asset_dir, '-name', '*.png'
).stdout().strip().split('\n')

gtk2_assets_dest = join_paths(gtk2_sources_dest, 'assets')
install_data(gtk2_asset_data, install_dir: gtk2_assets_dest)
