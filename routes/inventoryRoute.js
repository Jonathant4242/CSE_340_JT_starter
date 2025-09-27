const express = require("express")
const router = new express.Router()

// Inventory route
router.get("/inventory", (req, res) => {
  res.render("inventory", { title: "Inventory" })
})

module.exports = router