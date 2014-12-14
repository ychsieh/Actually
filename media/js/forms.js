
var formData = {};
var count = 1;
$("#newTaskBtn").click(function() {
    var taskField = $(".secTask").first().clone().val("");
    // $(this).parent().append("<br>");
    $(this).parent().append(taskField);
    var newBtn = $(this).clone(true,true);
    $(this).css("display","none");
    $(this).parent().append(newBtn);
    $(this).remove();
});

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

$("#lastStep").click(function() {
    window.location.href = "http://127.0.0.1:8000/createproject/";
});

$("#backFirst").click(function() {
    $("#step1").css("display","block");
    $("#step2").css("display","none");
});

$("#backSecond").click(function() {
    $("#step2").css("display","block");
    $("#step3").css("display","none");
})
