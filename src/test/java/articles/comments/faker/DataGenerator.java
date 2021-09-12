package articles.comments.faker;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {
    public static JSONObject generateNewComment() {
        Faker faker = new Faker();
        String body = faker.lorem().paragraph();

        JSONObject commentData = new JSONObject();

        commentData.put("body", body);

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("comment", commentData);

        return jsonObject;
    }
}
