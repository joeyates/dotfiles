Pry.commands.alias_command '.c', 'continue' unless Pry.commands['continue'].nil?
Pry.commands.alias_command '.s', 'step' unless Pry.commands['step'].nil?
Pry.commands.alias_command '.n', 'next' unless Pry.commands['next'].nil?
Pry.commands.alias_command '.f', 'finish' unless Pry.commands['finish'].nil?

Pry.config.prompt = proc { |obj, _, _| "#{obj}> " }

# vim: :set filetype=ruby :