package articles.faker;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {
    public static JSONObject generateNewArticle() {
        Faker faker = new Faker();
        String title = faker.lorem().sentence(3);
        String description = faker.lorem().sentence(7);
        String body = faker.lorem().paragraph();

        JSONObject articleData = new JSONObject();

        articleData.put("title", title);
        articleData.put("description", description);
        articleData.put("body", body);

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("article", articleData);

        return jsonObject;
    }
}
