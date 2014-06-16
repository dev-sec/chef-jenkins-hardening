# Jenkins Hardening

This cookbook aims to provide a default jenkins setup that is secure. Specificly it 

- installs jenkins behind nginx
- configures ssl for nginx
- configures user logins
- run jenkins slaves on different servers

Currently this cookbook is work-in-progress.

# Usage

This cookbook is optimized for a usage with [chef-os-hardening](https://github.com/TelekomLabs/chef-os-hardening) and [chef-ssh-hardening](https://github.com/TelekomLabs/chef-ssh-hardening), but has no direct dependency. Therefore this cookbook is even happy without them.

# Test

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# Kitchen test
bundle exec kitchen list
bundle exec kitchen test default-ubuntu-1204 

```

## References

- [Securing Jenkins](http://slideshare.net/cloudbees/securing-jenkins)

## Contributing

See [contributor guideline](CONTRIBUTING.md).

## License and Author

* Author:: Christoph Hartmann <chris@lollyrock.com>
* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.