$("#foods a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#foods').on('cocoon:after-insert',
     function() {
         $(".meal-food-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.meal-food-fields').on('cocoon:after-insert',
              function() {
                $(this).children(".food_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });