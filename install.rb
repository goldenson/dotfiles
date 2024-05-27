#!/usr/bin/ruby

USER_PATH = ENV["HOME"]

CONFIG_FILES = {
  zsh: ".zshrc",
  git: ".gitconfig",
  vscode: "settings.json",
  pry: ".pryrc",
  docker: "config.json",
}

def clean_up_existing_symlinks(config_key, file_name)
  if config_key == :vscode
    `rm ~/Library/ApplicationSupport/code/User/#{file_name}`
  elsif config_key == :docker
    `rm ~/.docker/#{file_name}`
  else
    `rm ~/#{file_name}`
  end
end

def create_symlink(config_key, file_name)
  if config_key == :vscode
    `ln -s #{USER_PATH}/code/dotfiles/#{file_name} ~/Library/ApplicationSupport/code/User/#{file_name}`
  elsif config_key == :docker
    `ln -s #{USER_PATH}/code/dotfiles/#{file_name} ~/.docker/#{file_name}`
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
