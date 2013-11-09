$ ->
  updateCabinDropdowns = ->
    options = []
    cabins  = $(".cabin")

    for cabin in cabins
      id         = $(cabin).attr("id")
      name       = $(cabin).find("h1").text()

      sexes = $(cabin).find(".kid .sex").text()
      sex   = ""
      sex   += "M" if /M/.test(sexes)
      sex   += "F" if /F/.test(sexes)

      ages       = $(cabin).find(".kid .age").map((index, age) -> $(age).text())
      youngest   = Math.min.apply null, ages
      oldest     = Math.max.apply null, ages

      cabin_info = "#{name} (#{sex} #{youngest}-#{oldest})"
      option     = "<option value='#{id}'>#{cabin_info}</option>"
      options.push option
    
    select = "<select>#{options.join()}</select>"

    kids = $(".kid")
    for kid in kids
      currentCabin = $(kid).parents(".cabin").attr("id")
      $(kid).find(".move").html(select).find("select").change moveKid
      $(kid).find(".move select").val(currentCabin)


  moveKid = ->
    moveTo = $(this).val()
    kid    = $(this).parents(".kid")
    $("##{moveTo} table").append(kid)

    updateCabinDropdowns()

    # TODO: Save it

  updateCabinDropdowns()