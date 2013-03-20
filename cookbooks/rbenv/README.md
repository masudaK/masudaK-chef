rbenv Cookbook
==============
This cookbook has the recipe which install [rbenv](https://github.com/sstephenson/rbenv/)

Requirements
------------
certificated on only CentOS6.4 and Ubuntu12.10... 

e.g.
#### packages
- `toaster` - rbenv needs toaster to brown your bagel.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### rbenv::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rbenv']['install_user_name']</tt></td>
    <td>Char</td>
    <td>which username install rbenv</td>
    <td><tt>vagrant</tt></td>
  </tr>
  <tr>
    <td><tt>['git']['version']</tt></td>
    <td>Char</td>
    <td>which version installed</td>
    <td><tt></tt></td>
  </tr>
</table>

Usage
-----
#### rbenv::default
Just include `rbenv` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rbenv]"
  ]
}
```

License and Authors
-------------------
Authors: TODO: List authors
