#!/usr/bin/ruby

USER_PATH = ENV["HOME"]

CONFIG_FILES = {
  zsh: ".zshrc",
  git: ".gitconfig",
  vscode: "settings.json",
  pry: ".pryrc",
  docker: "config.json",
  ssh: "config"
}

def clean_up_existing_symlinks(config_key, file_name)
  case config_key
  when :vscode
    `rm -f ~/Library/Application\\ Support/Code/User/#{file_name}`
  when :docker
    `rm -f ~/.docker/#{file_name}`
  when :ssh
    `rm -f ~/.ssh/#{file_name}`
  else
    `rm -f ~/#{file_name}`
  end
end

def create_symlink(config_key, file_name)
  case config_key
  when :vscode
    `ln -s #{USER_PATH}/code/dotfiles/#{file_name} ~/Library/Application\\ Support/Code/User/settings.json`
  when :docker
    `ln -s #{USER_PATH}/code/dotfiles/#{file_name} ~/.docker/#{file_name}`
  when :ssh
    `ln -s #{USER_PATH}/code/dotfiles/.ssh/#{file_name} ~/.ssh/#{file_name}`
  else
    `ln -s #{USER_PATH}/code/dotfiles/#{file_name} ~/#{file_name}`
  end
end

puts "⏳ Installing config files for : #{CONFIG_FILES.keys}"

CONFIG_FILES.each do |config_key, file_name|
  clean_up_existing_symlinks(config_key, file_name)
  create_symlink(config_key, file_name)
end

puts "✅ All config files have been imported succesfully !"
