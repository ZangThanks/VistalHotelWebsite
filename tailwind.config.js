/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./src/main/webapp/**/*.jsp",
        "./src/main/webapp/**/*.html",
        "./src/main/webapp/WEB-INF/views/**/*.jsp",
        "./src/main/webapp/WEB-INF/**/*.jsp",
        "./src/main/webapp/**/*.tag",
        "./src/main/webapp/**/*.js"
    ],
    theme: {
        extend: {},
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
    ],
};
