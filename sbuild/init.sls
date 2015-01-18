include:
  - sbuild.prereq

{% from 'schroot/state.jinja' import schroot_state_loop %}

{% set default_data = {
    'schroot_name_format': '{name}-{arch}-sbuild',
    'dist_aliases': True,
    'short_alias': False,
    'cdebootstrap_options': '--flavour=build',
    'debootstrap_options': '--variant=buildd',
} %}
{% set default_conf = {
    'union-type': 'aufs',
    'profile': 'sbuild',
    'groups': 'root,sbuild',
    'root-groups': 'root,sbuild',
    'source-root-groups': 'root,sbuild',
} %}

{{ schroot_state_loop(root_key='sbuild', default_data=default_data,
                      default_conf=default_conf, sls_require='sbuild.prereq') }}
