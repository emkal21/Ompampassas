package gr.uoa.di.utils.constraints;

import gr.uoa.di.utils.constraints.impl.CompanyNameUniqueConstraintValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = CompanyNameUniqueConstraintValidator.class)
public @interface CompanyNameUniqueConstraint {
    String message();

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}