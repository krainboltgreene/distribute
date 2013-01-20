require_relative "distribute/command"
require_relative "distribute/latest"
require_relative "distribute/release"
require_relative "distribute/version"

class Distribute
  attr_accessor :files, :version

  def initialize(files, version = nil)
    @files = files
    @version = version
  end

  def distribute!
    (version ? build_release : build_latest).distribute!
  end

  private

  def build_latest
    Latest.new files, version
  end

  def build_release
    Release.new files, version
  end

  def checkout_branch(name, orphan = false)
    Command.new("git checkout #{"--orphan" if orphan} #{name}").send!
  end

  def has_unsaved_changes?
    !Command.new("git status --porcelain").send!.empty?
  end

  def branch_exists?
    Command.new("git branch").send!.include? type
  end

  def check_for_unsaved_changes
    raise "You have unsaved changes!" if has_unsaved_changes?
  end

  def change_branches
    branch_exists? ? checkout_branch(type) : checkout_branch(type, true)
  end

  def clear_working_index
    Command.new("git rm -r --cache .").send!
  end

  def add_files_to_index
    files.each &method(:add_file_to_index)
  end

  def add_file_to_index(file)
    Command.new("git add #{file}").send!
  end

  def move_files
    files.each &method(:move_file) if files_exist?
  end

  def files_exist?
    files.all? { |file| File.exists? file }
  end

  def move_file(file)
    Command.new("mv #{file} #{new_file file}").send!
  end

  def get_new_files
    files.map! &method(:new_file)
  end

  def new_file(file)
    "#{file_name file}.#{file_extention file}"
  end

  def file_name(file)
    split_file_name(file).shift
  end

  def file_extention(file)
    split_file_name(file).tap(&:shift).join "."
  end

  def file_from_path(file)
    file.split(File::SEPARATOR).last
  end

  def split_file_name(file)
    file_from_path(file).split "."
  end

  def commit_index
    Command.new("git commit -m 'Adding the #{type} distribution'").send!
  end

  def push
    Command.new("git push origin #{type}").send!
  end

  def setup_branch
    check_for_unsaved_changes
    change_branches
    clear_working_index
    move_files
    get_new_files
    add_files_to_index
    commit_index
  end
end
