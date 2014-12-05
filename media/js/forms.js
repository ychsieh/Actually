
var formData = {};
var count = 1;
$("#newSecBtn").click(function() {
        window.count += 1;
        var sectionName = "Developer " + window.count.toString();
        var title = $("<label></label>").text(sectionName);
        //alert("ads");
        $("#sections").append(title);
        $("#sections").append("<br>");
        var newSection = $(".section").first().clone(true);
        $("#sections").append(newSection);
        var newBtn = $("#newSecBtn").clone(true,true);
        $("#newSecBtn").remove();
        var msg = $(".totalPer").clone(true,true);
        $(".totalPer").remove();
        $("#sections").append(newBtn,msg);
});
$("#toSecond").click(function() {
    //$("#formTitle").html("Step 2 of 3: Work Distribution");
    $("#step1").css("display","none");
    $("#step2").css("display","block");
    window.formData["projectName"] = $("#name").val();
    window.formData["repo"] = $("#repo option:selected").text();
});
var mCount = 3;
$("#newMilBtn").click(function() {
            window.mCount += 1;
            var mileName = "Milestone " + window.mCount.toString();
            var title = $("<label></label>").text(mileName);
            $("#milestones").append(title);
            //var mileWrapper = $(".milestone").first().clone(true);
            //$("#milestones").append(mileWrapper);
            //var oldMile = document.getElementsByClassName("mileTitle")[mileCount-2];
            //var newMile = oldMile.cloneNode(true);
            var tLabel = $("<p></p>").text(" Milestone Name: ").addClass("form-control-static indent");
            var newMile = $(".mileTitle").first().clone().val("");
            $("#milestones").append(tLabel);
            $("#milestones").append(newMile);
            var date = $("<p></p>").text("Estimate Deadline: ").addClass("form-control-static indent");
            $("#milestones").append(date);
            //var oldDate = document.getElementsByClassName("mileDate")[mileCount-2];
            //var newDate = oldDate.cloneNode(true);
            var newDate = $(".mileDate").first().clone().val("");
            $("#milestones").append(newDate);
            $("#milestones").append("<br>");
            var newBtn = $("#newMilBtn").clone(true,true);
            $("#newMilBtn").remove();
            $("#milestones").append(newBtn);
    });
$("#toThird").click(function() {
    //$("#formTitle").html("Step 3 of 3: Milestones");
    $("#step2").css("display","none");
    $("#step3").css("display","block");
    var sections = [];
    var totalWork = 0;
    $(".secDeveloper").each(function(index){
        var section = {};
        section["developer"] = $("option:selected",this).text();
        section["section"] = $(".secName").eq(index).val();
        section["percentage"] = parseInt($(".secPer").eq(index).val());
        totalWork = totalWork + section["percentage"];
        sections[index]=section;
    });
    for (var i = 0; i < sections.length; i++) {
        sections[i]["percentage"] = sections[i]["percentage"]/totalWork*100;
    }
    window.formData["sections"] = sections;
});
$("#lastStep").click(function() {
    var milestones = [];
    $(".mileTitle").each(function(index) {
        var milestone = {};
        milestone["name"] = $(this).val();
        milestone["deadline"] = $(".mileDate").eq(index).val();
        milestones[index] = milestone;
    });
    window.formData["milestones"] = milestones;
    console.log(formData);
    
    $.ajax({                    
        url: "http://127.0.0.1:8000/store_project_info",     
        type: 'post', // performing a POST request
        data : formData,
        dataType: 'json',                   
        success: function(data)         
        {
            console.log(data);
        } 
    });
});
$("#backFirst").click(function() {
    $("#step1").css("display","block");
    $("#step2").css("display","none");
});
$("#backSecond").click(function() {
    $("#step2").css("display","block");
    $("#step3").css("display","none");
})
