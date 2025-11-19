/** @type {import('tailwindcss').Config} */
export default {
  darkMode: "class",
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: "#000000",
        "background-light": "#f7f7f7",
        "background-dark": "#191919",
        "brand-off-white": "#FAFAFA",
        "brand-dark-gray": "#111111",
        "brand-light-beige": "#D5BFA3",
        "brand-light-gray": "#CFCFCF",
        "brand-deep-black": "#000000",
      },
      fontFamily: {
        "heading": ["Playfair Display", "serif"],
        "sub": ["Lora", "serif"],
        "body": ["Inter", "sans-serif"]
      },
      borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/container-queries'),
  ],
}
