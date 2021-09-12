package users.faker;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {
    public static JSONObject generateNewUser() {
        Faker faker = new Faker();
        String username = faker.lorem().word() + faker.random().nextInt(10, 99);
        String email = faker.internet().emailAddress();
        String password = faker.animal().name() + faker.random().nextInt(10000, 50000);


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
        String password = faker.animal().name() + faker.random().nextInt(1000, 5000);
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
