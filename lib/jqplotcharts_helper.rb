module JQPlotChartsHelper

def raw_concat(msg)
    concat(raw(msg))
end

def data_to_string(data)
    return data.to_s()
end

def render_jqplot_scatter_x(data, name, label, width, height)

    btn_id = "btn_" + name
    div_id = "div_" + name


    raw_concat('<div id="' + div_id + '" style="height: ' + height.to_s + 'px;width: ' + width.to_s + 'px; "></div>')
    raw_concat('<button id="'+btn_id+'"style=";">Save ' + label + '</button><br/>')
    raw_concat('<script type="text/javascript">')

    raw_concat('$(document).ready(function(){')

    raw_concat('var line = ' + data_to_string(data) + ';')
    raw_concat('var plot = $.jqplot("' + div_id + '", [line], {')
    aaw_concat('          title:"' + label + '",')
    raw_concat('          series:[ { showLine:false, }],')
    raw_concat('          seriesDefaults:{ renderer: $.jqplot.BubbleRenderer, rendererOptions: { autoscaleBubbles: false, bubbleGradient: true, bubbleAlpha: 0.5}, pointLabels: {show: true} },')
    raw_concat('          axes: {')
    raw_concat('              xaxis: {')
    raw_concat('                  label: "Risk Score",')
    raw_concat('                  tickInterval: 0.02,')
    raw_concat('                  labelRenderer: $.jqplot.CanvasAxisLabelRenderer')
    raw_concat('              },')
    raw_concat('              yaxis: {')
    raw_concat('                  label: "Complexity Score",')
    raw_concat('                  labelRenderer: $.jqplot.CanvasAxisLabelRenderer')
    raw_concat('              }')
    raw_concat('          }')
    raw_concat('        })')
    raw_concat('    });')
    raw_concat('$("#' + btn_id + '").click(function () {')
    raw_concat('           $("#' + div_id + '").jqplotSaveImage()')
    raw_concat('    });')
    raw_concat('</script>')

end

def render_jqplot_scatter(data, name, label, xlabel, ylabel, width, height)

    btn_id = "btn_" + name
    div_id = "div_" + name

    raw_concat('<div id="' + div_id + '" style="height: ' + height.to_s + 'px;width: ' + width.to_s + 'px; "></div>')
    raw_concat('<button id="'+btn_id+'"style=";">Save ' + label + '</button><br/>')
    raw_concat('<script type="text/javascript">')

    raw_concat('$(document).ready(function(){')

    raw_concat('var line = ' + data_to_string(data) + ';')
    raw_concat('var plot = $.jqplot("' + div_id + '", [line], {')
    raw_concat('        title:"' + label + '",' )
    raw_concat('        seriesDefaults:{ rendererOptions: { }, pointLabels: { show: true } },')
    raw_concat('        cursor:{ show: true , zoom: true },')
    raw_concat('        series:[ { showLine:false, markerOptions: { size: 7, style:"x" } } ],')
    raw_concat('        axes: { ')
    raw_concat('              xaxis: {')
    raw_concat('                  label: "' + xlabel + '",')
    raw_concat('                  labelRenderer: $.jqplot.CanvasAxisLabelRenderer')
    raw_concat('              },')
    raw_concat('              yaxis: {')
    raw_concat('                  label: "' + ylabel + '",')
    raw_concat('                  labelRenderer: $.jqplot.CanvasAxisLabelRenderer')
    raw_concat('              }')
    raw_concat('        } ')
    raw_concat('    });')
    raw_concat('});')
    raw_concat('$("#' + btn_id + '").click(function () {')
    raw_concat('           $("#' + div_id + '").jqplotSaveImage()')
    raw_concat('    });')
    raw_concat('</script>')

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
    raw_concat('seriesDefaults:{ rendererOptions: { barWidth:15, barMargin:5}, pointLabels: { show: true } },')
    raw_concat('axes: {')
    raw_concat('    xaxis: {')
    raw_concat('        pad: 1,')
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
