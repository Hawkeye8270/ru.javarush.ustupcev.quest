package repository;

import model.Question;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class QuestionRepositoryTest {

    @Test
    void getQuestionById() {

        Question question = new Question();
        question.setId(3);
        question.setStep("Ты поднялся на мостик");
        question.setQuestion("Расскажешь о себе правду");

        assertEquals(3, question.getId());
        assertEquals("Ты поднялся на мостик", question.getStep());
        assertEquals("Расскажешь о себе правду", question.getQuestion());

    }
}