// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function(){
    $('#launch').click(function(){
        console.log('load!');
        $('#select-form').hide();
        $('#progress').toggleClass('hide');
        parseCSV($('#csv-file')[0]);
        return false;
    });

    if(document.getElementById('new_vote')) {

        var last_selected = null;

        $('input[type="radio"]').click(function (e) {
            if (e.target.checked && e.target == last_selected) {
                $(e.target).prop('checked', false);
                last_selected = null;
            } else {
                last_selected = e.target;
            }
        });

        var can_submit = false;

        $('#confirmButton').click(function(){
            can_submit = true;
            $('form').submit();
            $('#confirmDialog').modal('hide');
        });

        $('form').submit(function(){
            if(!can_submit && $(this).serializeArray().length < 3){
                $('#confirmDialog').modal('show');
            } else {
                can_submit = true;
            }
            return can_submit;
        });
    }
});

/**
 * Parse CSV and put data in table.
 */
function parseCSV(filePath) {
    console.log(filePath);
    // Read file and then (callback) fill the table
    readFile(filePath, function (e) {
        const data = $.csv.toObjects(e.target.result);
        var i = 0;
        var start = new Date();
        var loadNext = function(){
            var $progress = $('.progress-bar');
            if(i>=data.length){
                $progress.css('width','100%').html('It\'s the end');
                setTimeout(function(){
                    $('#select-form').show();
                    $('#progress').toggleClass('hide');
                },5000);
                return;
            }
            var v = data[i];
            i++;
            var position = Math.round((i/data.length)*100);
            $progress.css('width',position+'%').html(position+'%');
            if(v.email)
                $.post('',{voter:{first_name:v.first_name, last_name: v.last_name, email: v.email}},function(result){
                    console.log(result);
                    loadNext();
                });
            else
                loadNext();
        };
        loadNext();
    });
}

/**
 * read text input
 */
function readFile(filePath, onLoadCallback) {
    var reader = new FileReader();
    reader.onload = onLoadCallback;
    if (filePath.files && filePath.files[0]) {
        reader.readAsText(filePath.files[0]);
    }
}