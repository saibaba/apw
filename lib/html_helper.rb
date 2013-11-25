module HTMLHelper

def raw_concat(msg)
    concat(raw(msg))
end

def data_to_string(data)
    return data.to_s()
end

def render_table(tbl_id, headers, data, caption, clazz)

    raw_concat('<table id="' + tbl_id + '" class="' + clazz + '">')
    raw_concat('<caption>' + caption + '</caption>')
    raw_concat('<thead><tr>')
    headers.each do |h|
        raw_concat('<th>' + h + '</th>')
    end
    raw_concat('</tr></thead><tbody>')
    data.each do |row|
        raw_concat('<tr>')
        row.each do |col|
            raw_concat('<td>' + col + '</td>')
        end
        raw_concat('</tr>')
    end

    raw_concat('</tbody></table>')

end

end
