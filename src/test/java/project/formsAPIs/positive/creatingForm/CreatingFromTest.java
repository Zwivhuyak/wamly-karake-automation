package project.formsAPIs.positive.creatingForm;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CreatingFromTest {
   @Test
    public void positiveCreatingFormTests(){
        Results rs= Runner.path("classpath:project/formsAPIs/positive/creatingForm/positive.feature")
                .outputCucumberJson(true)
                .backupReportDir(false)
                .parallel(1);
        generateReport(rs.getReportDir());
        Assert.assertTrue(rs.getErrorMessages(),rs.getFailCount()==0);
    }
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "FormsTestcases");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
