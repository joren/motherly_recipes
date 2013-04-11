$(document).ready(function() {

  $("#e1").select2({
    placeholder: "Zoek naar een recept",
    minimumInputLength: 3,
    ajax: {
      url: "/recipes.json",
      dataType: 'json',
      quietMillis: 100,
      data: function (term) {
        return {
          q: escape(term)
        };
      },
      results: function (data) {
          all_results = [{id: '?search='+$('.select2-input').val(), description: '', name: '<strong>Toon alle resultaten</strong> <i class="icon-list"></i>', picture_file_name: null}]
          return {results: all_results.concat(data)};
        }
      },
      formatResult: recipesFormatResult,
      formatSelection: recipesFormatSelection,
      dropdownCssClass: "bigdrop"
  });
  $('#e1').select2('focus');
});

function recipesFormatResult(recipe) {
  if (recipe.picture_file_name == null)
  {
    var markup = "<table class='recipe-result'><tr>";
    markup += "<td class='recipe-info'><div class='recipe-title'><strong>" + recipe.name + "</strong></div>";
    markup += "<div class='recipe-description'>" + recipe.description + "</div>";
    markup += "</td></tr></table>"
  }
  else
  {
    var markup = "<table class='recipe-result'><tr>";
    markup += "<td class='recipe-image'><img src='/system/recipes/pictures/000/000/0" + recipe.id + "/thumb/" + recipe.picture_file_name + "'/></td>";
    markup += "<td class='recipe-info'><div class='recipe-title'><strong>" + recipe.name + "</strong></div>";
    markup += "<div class='recipe-description'>" + recipe.description + "</div>";
    markup += "</td></tr></table>"
  }
  return markup;
}

function recipesFormatSelection(recipe) {
  window.location = '/recipes/' + recipe.id;
}
