module ConventionalChangelog
  class ByDateWriter < Writer
    private

    def filter_key
      :since_date
    end

    def write_new_lines(options)
      commits.group_by { |commit| commit[:date] }.sort.reverse.each do |date, commits|
        write_section commits, date
      end
    end

    def version_header_title(id)
      id
    end
  end
end
