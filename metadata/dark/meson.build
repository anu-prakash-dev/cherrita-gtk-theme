conf_data = configuration_data()
conf_data.set('ThemeName', theme_name + '-dark')
conf_data.set('VariantThemeName', theme_name + '-dark')
configure_file(input : '../index.theme.in',
            output : 'index.theme',
            configuration : conf_data,
            install_dir: join_paths(root_themedir, theme_name + '-dark'))
