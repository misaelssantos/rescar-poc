package br.gov.serpro.dedat.rescar.acesso.infrastructure.validation.beanvalidation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;
import javax.validation.ReportAsSingleViolation;
import javax.validation.constraints.NotBlank;

import br.gov.serpro.dedat.rescar.acesso.infrastructure.enumeration.ValueLabelEnum;

@NotBlank
@Constraint(validatedBy = ValidEnumValidator.class)
@Documented
@Target({ElementType.FIELD })
@Retention(value = RetentionPolicy.RUNTIME)
@ReportAsSingleViolation
public @interface ValidEnum {

    Class<? extends ValueLabelEnum<?>> enumClass();

    String message() default "{javax.validation.constraints.ValidEnum.message}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
