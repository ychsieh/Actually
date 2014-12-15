var formData = {};
var count = 1;

//add a new task
$("#newTaskBtn").click(function() {
    var taskField = $(".secTask").first().clone().val("");
    // $(this).parent().append("<br>");
    $(this).parent().append(taskField);
    var newBtn = $(this).clone(true,true);
    $(this).css("display","none");
    $(this).parent().append(newBtn);
    $(this).remove();
});

//add a new section
$("#newSecBtn").click(function() {
        window.count += 1;
        var sectionName = "Section " + window.count.toString();
        var title = $("<label></label>").text(sectionName);
        $("#sections").append(title);
        //$("#sections").append("<br>");
        var newSection = $(".section").first().clone(false, false);
        $("#sections").append(newSection);
        var newsec = $(".section").last().find("input");
        newsec.each(function( index ) {
            if(index == 0 || index == 1){
                $( this ).val("");
            }
            else{
                $( this ).remove();
                //$(this).find("br").last().remove();
            }
        });
        $("#sections").append("<br>");
        var newBtn = $("#newSecBtn").clone(true,true);
        $("#newSecBtn").remove();
        $("#sections").append(newBtn);
});

//go to step 2
$("#toSecond").click(function() {
    //$("#formTitle").html("Step 2 of 3: Work Distribution");    
    var name = $("#name").val();
    if(name == ''){
        alert('Project name cannot be none!');
        return;
    }
    else
        window.formData["projectName"] = $("#name").val();
    window.formData["repo"] = $("#repo option:selected").text();
    $("#step1").css("display","none");
    $("#step2").css("display","block");
});

var mCount = 1;
//add a new milestone
$("#newMilBtn").click(function() {
    window.mCount += 1;
    var mileName = "Milestone " + window.mCount.toString();
    var title = $("<label></label>").text(mileName);
    $("#milestones").append("<br>");
    $("#milestones").append(title);
    var tLabel = $("<p></p>").text(" Milestone Name: ").addClass("form-control-static indent");
    var newMile = $(".mileTitle").first().clone().attr("value","");
    $("#milestones").append(tLabel);
    $("#milestones").append(newMile);
    var date = $("<p></p>").text("Estimate Deadline: ").addClass("form-control-static indent");
    $("#milestones").append(date);
    var newDate = $(".mileDate").first().clone().attr("value","");
    $("#milestones").append(newDate);
    var taskLabel = $("<p></p>").text("Milestone Task(s): ").addClass("form-control-static indent");
    var newTask = $(".mileTask").first().clone();
    $("#milestones").append(taskLabel);
    $(".taskMsg").first().clone().appendTo("#milestones");
    $("#milestones").append(newTask);
    $("#milestones").append("<br>");
    var newBtn = $("#newMilBtn").clone(true,true);
    $("#newMilBtn").remove();
    $("#milestones").append(newBtn);
});

//go to step 3
$("#toThird").click(function() {
    //$("#formTitle").html("Step 3 of 3: Milestones");
    var sections = [];
    var totalWork = 0;
    var break1 = false;
    $(".section").each(function(index) {
        var section = {};
        section["tasks"] = [];
        var deve = $(".secDeveloper option:selected", this).text();
        if(deve == ''){
            alert('Section should be assigned to a developer!');
            break1 = true;
        }
        else
            section["developer"] = deve;
        section["section"] = $(".secName", this).val();
        section["percentage"] = parseInt($(".secPer", this).val());
        totalWork = totalWork + section["percentage"];
        $(".secTask",this).each(function(subindex) {
            section["tasks"][subindex] = $(this).val();
        });
        sections[index] = section;
    });
    if(break1)
        return;
    
    for (var i = 0; i < sections.length; i++) {
        sections[i]["percentage"] = sections[i]["percentage"]/totalWork*100;
    }
    $(".mileDate").each(function() {
        var d = new Date();
        var month = d.getMonth()+1;
        var day = "";
        if (d.getDate()<10) {
            day = "0" + d.getDate();
        }else {
            day = toString(d.getDate());
        }        
        var date = d.getFullYear() + "-" + month + "-" + day;
        $(this).attr("min",date);
    });
    $(".mileTask").each(function() {
        for (var i = 0; i < sections.length; i++) {
            var devName = sections[i]["developer"];
            for (var j = 0; j < sections[i]["tasks"].length ; j++) {
                var devTask = sections[i]["tasks"][j];
                var taskOption =  $("<option></option>").text(devName + " - " + devTask);
                $(this).append(taskOption);
            }
        }
    });
    window.formData["sections"] = sections;
    $("#step2").css("display","none");
    $("#step3").css("display","block");
});

//submit the form using AJAX
$("#lastStep").click(function() {
    // window.location.href = 'http://127.0.0.1:8000/auth';
    var milestones = [];
    $(".mileTitle").each(function(index) {
        var milestone = {};
        milestone["name"] = $(this).val();
        milestone["deadline"] = $(".mileDate").eq(index).val();
        milestone["tasks"] = [];
        var selected = $(".mileTask").eq(index).find(":selected");
        $.each(selected, function(index) {
            milestone["tasks"][index] = $(this).text();
        });
        milestones[index] = milestone;
    });
    window.formData["milestones"] = milestones;
    console.log(formData);

    $.ajax({                    
        url: "http://127.0.0.1:8000/createproject/",     
        type: 'get', // performing a POST request
        data : formData,
        // dataType: 'json',                   
        success: function(data)         
        {
            console.log(data);
            $('html').html(data);
        } 
    });
});

//back to step 1
$("#backFirst").click(function() {
    $("#step1").css("display","block");
    $("#step2").css("display","none");
});

//back to step 2
$("#backSecond").click(function() {
    $("#step2").css("display","block");
    $("#step3").css("display","none");
})
