theme_variants = [
    theme_name + '-dark',
    theme_name
]

foreach variant: theme_variants
    conf = configuration_data()
    conf.set('ThemeName', variant)
    conf.set('VariantThemeName', variant)
    index = configure_file(input : 'index.theme.in',
                           output : variant + '.theme',
                           configuration : conf)
    install_data(index, rename: 'index.theme', install_dir: join_paths(root_themedir, variant))
endforeach
