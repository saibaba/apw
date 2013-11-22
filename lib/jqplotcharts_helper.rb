module JQPlotChartsHelper

def raw_concat(msg)
    concat(raw(msg))
end

def data_to_string(data)
    return data.to_s()
end

def render_jqplot_chart(data, name, width, height) 

    btn_id = "btn_" + name
    div_id = "div_" + name

    raw_concat('<div id="' + div_id + '" style="height: ' + height.to_s + 'px;width: ' + width.to_s + 'px; "></div>')
    raw_concat('<button id="'+btn_id+'"style=";">Save ' + name + '</button><br/>')
    raw_concat('<script type="text/javascript">')

    raw_concat('$(document).ready(function(){')
    raw_concat('var line = ' + data_to_string(data) + ';')
    raw_concat('var plot = $.jqplot("' + div_id + '", [line], {')
    raw_concat('title: "' + name + '",')
    raw_concat('series:[{renderer:$.jqplot.BarRenderer}],')
    raw_concat('seriesDefaults:{ rendererOptions: { barWidth:15, barMargin:5}},')
    raw_concat('axes: {')
    raw_concat('    xaxis: {')
    raw_concat('        renderer: $.jqplot.CategoryAxisRenderer,')
    raw_concat('        label: "Application",')
    raw_concat('        labelRenderer: $.jqplot.CanvasAxisLabelRenderer ,')
    raw_concat('        tickRenderer: $.jqplot.CanvasAxisTickRenderer ,')
    raw_concat('        tickOptions: {')
    raw_concat('            angle: +30,')
    raw_concat('            fontSize: "10pt",')
    raw_concat('            labelPosition: "start"')
    raw_concat('        }')
    raw_concat('    },')
    raw_concat('    yaxis: {')
    raw_concat('        label: "score",')
    raw_concat('        labelRenderer: $.jqplot.CanvasAxisLabelRenderer')
    raw_concat('    }')
    raw_concat('}')
    raw_concat('});')
    raw_concat('});')
    raw_concat('$("#' + btn_id + '").click(function () {')
    raw_concat('           $("#' + div_id + '").jqplotSaveImage()')
    raw_concat('    });')
    raw_concat('</script>')
end

end
