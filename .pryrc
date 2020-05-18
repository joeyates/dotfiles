Pry.commands.alias_command '.c', 'continue' unless Pry.commands['continue'].nil?
Pry.commands.alias_command '.s', 'step' unless Pry.commands['step'].nil?
Pry.commands.alias_command '.n', 'next' unless Pry.commands['next'].nil?
Pry.commands.alias_command '.f', 'finish' unless Pry.commands['finish'].nil?

Pry::Prompt.add(:jgy, "Overridden default prompt", [">", "...>"]) do |context, _nesting, pry_instance, sep|
  "#{context}#{sep} "
end

Pry.config.prompt = Pry::Prompt[:jgy]

# Load plugin options:
Pry.plugins.values.each(&:load_cli_options)

# vim: :set filetype=ruby :
