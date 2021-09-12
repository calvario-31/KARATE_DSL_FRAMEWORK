import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

import java.util.Locale;

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

    public static JSONObject generateNewUser() {
        Faker faker = new Faker();
        String username = faker.lorem().word() + faker.random().nextInt(10, 99);
        String email = faker.internet().emailAddress();
        String password = faker.random().nextInt(10000000, 99999999).toString();

        JSONObject userData = new JSONObject();

        userData.put("username", username);
        userData.put("email", email);
        userData.put("password", password);

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("user", userData);

        return jsonObject;
    }

    public static JSONObject generateUpdateUser() {
        Faker faker = new Faker();
        String username = faker.name().username() + faker.random().nextInt(20, 100);
        String email = faker.internet().emailAddress();
        String password = faker.random().nextInt(10000000, 99999999).toString();
        String bio = faker.backToTheFuture().quote();
        String image = faker.internet().image();

        JSONObject userData = new JSONObject();

        userData.put("username", username);
        userData.put("email", email);
        userData.put("password", password);
        userData.put("bio", bio);
        userData.put("image", image);

        JSONObject jsonObject = new JSONObject();

        jsonObject.put("user", userData);

        return jsonObject;
    }
}
